class Entry < ActiveRecord::Base
  belongs_to :user

  def self.new_from_url(url)
    obj = FiddleFart::Parser.parse(url)
    entry = self.new
    entry.site = obj.class.name
    entry.remote_id = obj.try(:id)
    entry.revision = obj.try(:revision)
    entry.username = obj.try(:username)
    entry
  end

  def edit_link
    driver.edit_link
  end

  def share_link
    driver.share_link
  end

  def embed_url
    driver.embed_url
  end

  def driver
    @driver ||= site.constantize.new({
      id: remote_id,
      revision: revision,
      username: username
    })
  end
end

