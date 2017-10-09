module Neticoa
  class Timer
    def initialize(app, params)
      @app = app
      @name= params[:app]
    end

    def call(env)
      avant = Time.now
      status, headers, body = @app.call(env)
      apres = Time.now

      diff = apres - avant

      puts "=" * 80
      puts "[#{@name}] La requete a duré #{diff} secondes"
      puts "=" * 80

      [status, headers, body]
    end
  end
end
