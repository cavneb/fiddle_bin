class EntrySerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id, :edit_link, :share_link, :embed_url
end
