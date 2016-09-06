require 'will_paginate/array'

Admin.controllers :test_runs do

  get :index do
    query = "select min(id) as id, sum(duration) as total_duration, sum(example_count) as all_examples, sum(failure_count) as all_failures, sum(pending_count) as all_pending, max(computer_name) as computer_name, min(created_at) as created_at_min, max(updated_at) as updated_at_max, max(test_suites_id) as test_suites_id, build from test_runs where test_suites_id = ? group by build", params[:test_suite_id]
    @results = TestRun.find_by_sql(query)
    @test_runs = @results.paginate(:page => params[:page], :per_page => 10)
    @test_suite = params[:test_suite]
    @test_suite_id = params[:test_suite_id]

    render 'test_runs/index'
  end

  get :new do
    @test_run = TestRun.new
    render 'test_runs/new'
  end

  post :create do
    @test_run = TestRun.new(params[:test_run])
    if @test_run.save
      flash[:notice] = 'TestRun was successfully created.'
      redirect url(:test_runs, :edit, :id => @test_run.id)
    else
      render 'test_runs/new'
    end
  end

  get :edit, :with => :id do
    @test_run = TestRun.find(params[:id])
    render 'test_runs/edit'
  end

  put :update, :with => :id do
    @test_run = TestRun.find(params[:id])
    if @test_run.update_attributes(params[:test_run])
      flash[:notice] = 'TestRun was successfully updated.'
      redirect url(:test_runs, :edit, :id => @test_run.id)
    else
      render 'test_runs/edit'
    end
  end

  delete :destroy, :with => :id do
    test_run = TestRun.find(params[:id])
    if test_run.destroy
      flash[:notice] = 'TestRun was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy TestRun!'
    end
    redirect url(:test_runs, :index)
  end
end
