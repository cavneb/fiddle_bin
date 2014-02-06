class EmberController < ApplicationController
  def index
    @env = {}
    @env['CURRENT_USER'] = current_user.as_json if current_user
  end
end
