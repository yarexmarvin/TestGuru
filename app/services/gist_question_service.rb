class GistQuestionService

  def initialize(test_passage, client = default_client)
    @test_passage = test_passage
    @question = test_passage.current_question
    @test = @question.test
    @client = client
  end

  def success?
    @client.last_response.status == 201
  end

  def call
    gist = structured_gist

    stored_gist = @question.gists.new({ url: gist.url, question_id: @question.id, user_id: @test_passage.user_id })

    gist if stored_gist.save
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch("GITHUB_ACCESS_TOKEN"))
  end

  def create_gist
    @client.create_gist(gist_params)
  end

  def structured_gist
    Struct.new("StructuredGist", :id, :url)
    gist = create_gist
    Struct::StructuredGist.new(gist[:id], gist[:html_url])
  end

  def gist_params
    {
      description: I18n.t("gist_questions_service.description", test: @test.title),
      'public': false,
      files: {
        'test-gutu-question.txt': {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
