class TestsController < Simpler::Controller

  def index
    @time = Time.now
    # render plain: "Plain text response"
    status 201
    # render "tests/list"
  end

  def create
    @time = Time.now
    render plain: "Test created"
    status 210
  end

  def show
    @time = Time.now
    @test_id = params[:id]
    status 211
  end

end
