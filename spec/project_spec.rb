require("spec_helper")

describe(Project) do
  it("has many employees") do
    test_project = Project.create({:name => "Terribly important project"})
    test_employee1 = Employee.create({:name => "Marie-Grace Gardner", :project_id => test_project.id})
    test_employee2 = Employee.create({:name => "Rohan Patel", :project_id => test_project.id})
    expect(test_project.employees()).to(eq([test_employee1,test_employee2]))
  end
end
