require 'resque'

class CommentMailer < ActionMailer::Base
  include Resque::Mailer

  def comment_notification(comment_id)
    comment = Comment.find comment_id
    @comment = comment
    @task = comment.task

    mail(:to => comment.user.email, :subject => "[#{comment.task.project.name}] #{comment.user.name} made a new comment on ##{comment.task.id} - #{comment.task.name}", :from => "startrack@example.com.br")
  end
end
