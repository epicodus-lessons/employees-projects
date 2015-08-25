require('spec_helper')

describe('employee functionality through application', {:type => :feature}) do
  it('allows a user to add a new employee') do
    visit('/')
    click_link('View Employees')
    fill_in('employee_name', :with => "Jing Po")
    click_button('Add Employee')
    expect(page).to have_content('Jing Po')
  end

  it('allows a user to view details for a single employee') do
    visit('/employees')
    fill_in('employee_name', :with => "Lulu Beansy")
    click_button('Add Employee')
    click_link("Lulu Beansy")
    expect(page).to have_content('Employee: Lulu Beansy')
  end

  it('allows a user to associate a project with an employee') do
    visit('/projects')
    fill_in('project_name', :with => "Book incineration project")
    click_button('Add Project')
    click_link('View Employees')
    fill_in('employee_name', :with => "Guy Montagues")
    click_button('Add Employee')
    click_link("Guy Montague")
    select("Book incineration project", :from => "project_id")
    click_button("Submit")
    expect(page).to have_content('Book incineration project')
  end
end
