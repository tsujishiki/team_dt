# Preview all emails at http://localhost:3000/rails/mailers/article_notifier
class ArticleNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/article_notifier/received
  def received
    ArticleNotifier.received
  end

  # Preview this email at http://localhost:3000/rails/mailers/article_notifier/shipped
  def shipped
    ArticleNotifier.shipped
  end

end
