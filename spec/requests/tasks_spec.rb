require 'rails_helper'

describe "Tasks" do
  describe "GET /tasks" do
    it "display some task" do
      @task = Task.create :task => 'go to the shop'
      visit tasks_path
      page should have_content 'go to the shop'
    end
  end
end
