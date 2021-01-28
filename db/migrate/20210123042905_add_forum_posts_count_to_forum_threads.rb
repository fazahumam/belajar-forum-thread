class AddForumPostsCountToForumThreads < ActiveRecord::Migration[6.0]
  def change
    add_column :forum_threads, :forum_posts_count, :integer, default: 0

    ForumThread.all.each do |q|
      ForumThread.reset_counters(q.id, :forum_posts_count)
    end
  end
end
