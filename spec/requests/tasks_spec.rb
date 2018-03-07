require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "display some task" do
      visit tasks_path
      page should have content 'go back to the shop'
    end
  end
end
