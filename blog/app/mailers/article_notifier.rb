class ArticleNotifier < ApplicationMailer
  
  default from: 'Tsuji Shiki <tsujishiki@gmail.com>'
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_notifier.received.subject
  #
  def received(article)
    # @greeting = "Hi"
    
    @article = article

    mail to: "to@example.org", subject: '文章创建成功'
  end
  
end
