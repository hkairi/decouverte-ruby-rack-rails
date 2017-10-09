# class Calcul
#   def fn(a, b, c = 0)
#     a * b + c
#   end
#
#   def method_missing(method, arg)
#     "je sais que la méthode '#{method}' n''existe pas "
#   end
# end
#
# c1 = Calcul.new
# p c1.fn(1, 2, 4)
# p c1.bonjour('vous')

#nom = 'Kurosaki ichigo'
#chaine = "Bonjour, #{nom}"

#res = chaine.split(',')
#tab = (1..6).to_a
#tab.each_with_index do |el, idx|
#  puts (el * 2) unless(idx % 2 == 0)
#end

#sayHello = -> (i){ puts i }
#sayHello = proc { |i| puts i }
#sayHello = lambda { |i| puts i }
#sayHello.call(3)
#sayHello.(3)
#sayHello === 3
#res = tab.reduce(0, &:+)
#p tab, res#, sum(tab)
#
# h1 = {} # h2 = Hash.new
#
# h1[:cle] = 'valeur'
# h1['kle'] = :valeur
# h1[1] = 2
#
# h1.each do |k, v|
#   h1[k] = v
# end
#
# puts h1

# module Site
#   module Blog
#     def self.included(klass)
#       klass
#     end
#
#     def self.extended(ghaity)
#       ghaity.include(Neticoa)
#       ghaity.include(Adie)
#     end
#
#     module Adie
#     end
#
#     module Neticoa
#       def articles
#         ['article 1', 'Article 2', 'Article 3']
#       end
#     end
#   end
# end
#
# class App
#   extend Site::Blog
# end

# Proc, lambda et ->

# def saluer!
# end
#
# def superieurAcinq?(n)
#   n > 5
# end
#
# p1 = proc     { |e| puts e}
# p2 = Proc.new { |e| puts e }
# ll = lambda   { |e| puts e}
# ff = -> (e)   { puts e }
#
# p1.call("bonjour depuis proc")
# p2.call("bonjour depuis Proc.new")
# ll.call("bonjour depuis lambda")
# ff.call("bonjour depuis ->")
#
# # évaluation ternaire
#
# def si(condition, siOui, siNon)
#   if(condition) then
#     siOui.call()
#   else
#     siNon.call()
#   end
# end
#
# si( 1 > 5, -> { puts 'vrai' }, -> { puts 'faux' } )
#
# class A
#   def saluer(personne)
#     return "bonjour #{personne}"
#   end
# end
#
# class B
#   def dire_bonjour(personne)
#     return 'je dis bonjour à ' + personne
#   end
# end
#
# class C < A
#   attr_accessor :nom
#
#   def initialize(nom, prenom, age)
#     @nom    = nom
#     @prenom = prenom
#     @age    = age
#   end
#
#   def nom_complet
#     "#{@prenom} #{@nom}"
#   end
#
#   def age=(nouvelAge)
#     @age = nouvelAge * 3
#   end
# end
#
# c = C.new('kurosaki', 'ichigo', 17)
# p c.nom_complet
#

# require 'json'
# JSON.parse("{\"id\":18768}")
#

# module App
#   class Metier
#     def isP(string)
#       string.upcase == string.upcase.reverse
#     end
#   end
# end

# rack
# une application Rack est un objet qui répond à .call

