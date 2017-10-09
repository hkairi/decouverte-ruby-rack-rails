require_relative 'repo.rb'

class MonContact
  def call(env)
    [
      200,
      {"Content-Type" => 'text/html'},
      [render('contact')]
    ]
  end

  private

  def getView
     view = ( 1 > 2 ) ? 'index' : 'contact'
     render(view)
  end

  def render(view)
    page = File.open("views/#{view}.html.erb").read
    @contacts = Repo.new.all
    ERB.new(page).result(binding)
  end
end
