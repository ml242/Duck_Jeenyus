class Admin < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  validates :email, :password, :password_confirmation, :presence => true
  validates :email, :uniqueness => true
  validates :password, :password_confirmation, :length => { in: 6..20 }

  def self.sort_by_date
    @comments = Comment.all
    @comments.sort_by! { |k| k[:date_created]}
  end
  def self.sort_by_upvote
    @comments = []
    comments = Comment.all
    comments.each do |comment|
      votes_up = Vote.where(comment_id: comment.id, value: 1)
      upvotes = 0
      votes_up.each do |vote|
        upvotes += 1
      end
      votes_down = Vote.where(comment_id: comment.id, value: 0)
      downvotes = 0
      votes_down.each do |vote|
        downvotes += 1
      end
      score = upvotes - downvotes
      lyric = Lyric.find(comment.lyric_id)
      lyric_id = lyric.id
      @comments << {
        :comment_id => comment.id,
        :comment_text => comment.text,
        :comment_date => comment.date_created,
        :upvotes => upvotes,
        :downvotes => downvotes,
        :score => score,
        :lyric_id => lyric_id,
        :song => lyric.song,
        :lyric => lyric.text
      }
    end
    @comments.sort_by! { |k| k[:score]}
  end
  def self.sort_by_downvote
    @comments = []
    comments = Comment.all
    comments.each do |comment|
      votes_up = Vote.where(comment_id: comment.id, value: 1)
      upvotes = 0
      votes_up.each do |vote|
        upvotes += 1
      end
      votes_down = Vote.where(comment_id: comment.id, value: 0)
      downvotes = 0
      votes_down.each do |vote|
        downvotes += 1
      end
      score = upvotes - downvotes
      lyric = Lyric.find(comment.lyric_id)
      lyric_id = lyric.id
      @comments << {
        :comment_id => comment.id,
        :comment_text => comment.text,
        :comment_date => comment.date_created,
        :upvotes => upvotes,
        :downvotes => downvotes,
        :score => score,
        :lyric_id => lyric_id,
        :song => lyric.song,
        :lyric => lyric.text
      }
    end
    @comments.sort_by! { |k| k[:score]}
    @comments.reverse!
  end
end