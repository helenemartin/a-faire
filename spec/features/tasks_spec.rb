require 'rails_helper'

feature "Tasks" do
  describe "GET /tasks" do
    it "display some task" do
      @task = Task.create :task => 'go to the shop'
      visit tasks_path
      expect(page).to have_content 'go to the shop'
    end
    
    it "creates a new task" do
      visit tasks_path
      fill_in 'Task', :with => 'go to work'
      click_button 'Create Task'
      expect(current_path).to eq(tasks_path)
      expect(page).to have_content 'go to work'
    end
  end
  
    describe "PUT /tasks" do
      it "edits a task" do
        visit task_path
        click_link 'Edit'
    end
  end
end
