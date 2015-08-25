require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/employees") do
  @employees = Employee.all()
  erb(:employees)
end

get("/projects") do
  @projects = Project.all()
  erb(:projects)
end

post("/employees") do
  name = params.fetch("employee_name")
  Employee.create({:name => name})
  redirect("/employees")
end

post("/projects") do
  name = params.fetch("project_name")
  Project.create({:name => name})
  redirect("/projects")
end

get("/employees/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  if @employee.project_id
    @project = Project.find(@employee.project_id)
  else
    @project = nil
  end
  @projects = Project.all
  erb(:employee)
end

get("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @employees = Employee.all
  erb(:project)
end

patch("/employees/:id") do
  project_id = params.fetch("project_id").to_i()
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:project_id => project_id})
  redirect back
end

patch("/projects/:id") do
  employee = Employee.find(params.fetch("employee_id").to_i())
  @project = Project.find(params.fetch("id").to_i())
  @project.employees.push(employee)
  redirect back
end
