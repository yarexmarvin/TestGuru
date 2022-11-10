class GistQuestionService

  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(:access_token => ENV['GITHUB_ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: I18n.t('gist_questions_service.description', test: @test.title ),
      'public': false,
      files: {
        'test-gutu-question.txt': {
          content: gist_content,
        },
      },
    }
  end




  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
