require 'rails_helper'

feature "Tasks" do
    describe "POST/ tasks" do
     it "creates a new task" do
        visit tasks_path
        fill_in 'task_task', :with => 'write emails'
        click_button 'Add task'
        expect(page).to have_content 'write emails'
        expect(page.find(".alert")).to have_content 'Task created'
      end
    end
    
    describe "sorting" do
      it "displays latest task on top completed the completed list" do
        visit tasks_path
        fill_in 'task_task', :with => 'my first task'
        click_button 'Add task'
        fill_in 'task_task', :with => 'my second task'
        click_button 'Add task'
        within(".pending-tasks") do
          find('.input', text: "Complete").first.click
          click_button 'Complete'
        end
        expect(within(".pending-tasks") do
          expect(first('.list-group-item')).to have_content 'my second task'
        end)
        
    end
  end
  
    describe "PUT /tasks" do
      it "edits a task" do
        visit tasks_path
        fill_in 'task_task', :with => 'write emails'
        click_button 'Add task'
        click_button 'Complete'
        completed_tasks = page.find(".completed-tasks")
        expect(completed_tasks).to have_content 'write emails'
        expect(page.find(".alert")).to have_content 'Task completed'
    end
  end
  describe "error messages" do
    it "signals empty input" do
      visit tasks_path
      click_button "Add task"
      expect(page.find(".alert")).to have_content "Task can't be blank"
    end
  end
end
