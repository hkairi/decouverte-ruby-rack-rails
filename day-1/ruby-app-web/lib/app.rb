require_relative 'repo'

class MonApplication
  def call(env)
    nom = URI.decode(env['QUERY_STRING']).split('=').last
    nom = nom.gsub('+', ' ') if nom

    Repo.new.add(nom) if nom

    [
      200,
      {"Content-Type" => 'text/html'},
      [render('index', nom)]
    ]
  end

  private

  def render(view, params = '')
    page = File.open("views/#{view}.html.erb").read
    @nom = params
    ERB.new(page).result(binding)
  end
end
