# coding: utf-8

puts 'Seeding the database...'

[
  {pt: 'Accesorios para Vehículos', es: 'Accesorios para Vehículos', en: 'Accesorios para Vehículos', fr: 'Accesorios para Vehículos'},
{pt: 'Objetos para Bebés',es: 'Objetos para Bebés', en: 'Objetos para Bebés', fr: 'Objetos para Bebés'},
{pt: 'Cámaras y Accesorios',es: 'Cámaras y Accesorios', en: 'Cámaras y Accesorios', fr: 'Cámaras y Accesorios'},
{pt: 'Celulares y Teléfonos',es: 'Celulares y Teléfonos', en: 'Celulares y Teléfonos', fr: 'Celulares y Teléfonos'},
{pt: 'Computación',es: 'Computación', en: 'Computación', fr: 'Computación'},
{pt: 'Deportes y Fitness',es: 'Deportes y Fitness', en: 'Deportes y Fitness', fr: 'Deportes y Fitness'},
{pt: 'Electrodomésticos y Aires Ac.',es: 'Electrodomésticos y Aires Ac.', en: 'Electrodomésticos y Aires Ac.', fr: 'Electrodomésticos y Aires Ac.'},
{pt: 'Electrónica, Audio y Video',es: 'Electrónica, Audio y Video', en: 'Electrónica, Audio y Video', fr: 'Electrónica, Audio y Video'},
{pt: 'Hogar, Muebles y Jardín',es: 'Hogar, Muebles y Jardín', en: 'Hogar, Muebles y Jardín', fr: 'Hogar, Muebles y Jardín'},
{pt: 'Industrias y Oficinas',es: 'Industrias y Oficinas', en: 'Industrias y Oficinas', fr: 'Industrias y Oficinas'},
{pt: 'Instrumentos Musicales',es: 'Instrumentos Musicales', en: 'Instrumentos Musicales', fr: 'Instrumentos Musicales'},
{pt: 'Juegos y Juguetes',es: 'Juegos y Juguetes', en: 'Juegos y Juguetes', fr: 'Juegos y Juguetes'},
{pt: 'Libros, Materiales Educativos',es: 'Libros, Materiales Educativos', en: 'Libros, Materiales Educativos', fr: 'Libros, Materiales Educativos'},
{pt: 'Música, Películas y Series',es: 'Música, Películas y Series', en: 'Música, Películas y Series', fr: 'Música, Películas y Series'},
{pt: 'Ropa y Accesorios',es: 'Ropa y Accesorios', en: 'Ropa y Accesorios', fr: 'Ropa y Accesorios'},
{pt: 'Salud y Belleza',es: 'Salud y Belleza', en: 'Salud y Belleza', fr: 'Salud y Belleza'},
{pt: 'Construcción',es: 'Construcción', en: 'Construcción', fr: 'Construcción'},
{pt: 'Animales y Mascotas',es: 'Animales y Mascotas', en: 'Animales y Mascotas', fr: 'Animales y Mascotas'}
].each do |name|
   category = Category.find_or_initialize_by(name_pt: name[:pt])
   category.update_attributes({
     name_en: name[:en]
   })
   category.update_attributes({
     name_fr: name[:fr]
   })
   category.update_attributes({
     name_es: name[:es]
   })
 end


{
  company_name: 'Ecuador Solidario',
  company_logo: '/assets/ecuadorsolidario/logo-ecuador-solidario-color.png',
  host: 'ecuadorsolidario.org',
  base_url: "http://ecuadorsolidario.org",

  email_contact: 'info@ecuadorsolidario.org',
  email_payments: 'financiero@ecuadorsolidario.org',
  email_projects: 'proyectos@ecuadorsolidario.org',
  email_system: 'system@ecuadorsolidario.org',
  email_no_reply: 'no-reply@ecuadorsolidario.org',
  facebook_url: "http://facebook.com/ecuadorsolidario.org",
  facebook_app_id: '173747042661491',
  twitter_url: 'http://twitter.com/ecuadorsolidario',
  twitter_username: "ecuadorsolidario",
  mailchimp_url: "http://catarse.us5.list-manage.com/subscribe/post?u=ebfcd0d16dbb0001a0bea3639&amp;id=149c39709e",
  catarse_fee: '0.0',
  support_forum: 'http://soporte.ecuadorsolidario.org/',
  base_domain: 'ecuadorsolidario.org',
  uservoice_secret_gadget: 'change_this',
  uservoice_key: 'uservoice_key',
  faq_url: 'http://soporte.ecuadorsolidario.org/',
  feedback_url: 'http://soporte.ecuadorsolidario.org/forums/103171-catarse-ideias-gerais',
  terms_url: 'http://soporte.ecuadorsolidario.org/knowledgebase/articles/161100-termos-de-uso',
  privacy_url: 'http://soporte.ecuadorsolidario.org/knowledgebase/articles/161103-pol%C3%ADtica-de-privacidade',
  about_channel_url: 'http://blog.ecuadorsolidario.org/conheca-os-canais-do-catarse/',
  instagram_url: 'http://instagram.com/ecuadorsolidario',
  blog_url: "http://blog.ecuadorsolidario.org",
  github_url: 'http://github.com/ecusolidario',
  contato_url: 'http://soporte.ecuadorsolidario.org/'
}.each do |name, value|
   conf = CatarseSettings.find_or_initialize_by(name: name)
   conf.update_attributes({
     value: value
   }) if conf.new_record?
end

OauthProvider.find_or_create_by!(name: 'facebook') do |o|
  o.key = 'your_facebook_app_key'
  o.secret = 'your_facebook_app_secret'
  o.path = 'facebook'
end

puts
puts '============================================='
puts ' Showing all Authentication Providers'
puts '---------------------------------------------'

OauthProvider.all.each do |conf|
  a = conf.attributes
  puts "  name #{a['name']}"
  puts "     key: #{a['key']}"
  puts "     secret: #{a['secret']}"
  puts "     path: #{a['path']}"
  puts
end


puts
puts '============================================='
puts ' Showing all entries in Configuration Table...'
puts '---------------------------------------------'

CatarseSettings.all.each do |conf|
  a = conf.attributes
  puts "  #{a['name']}: #{a['value']}"
end

Rails.cache.clear

puts '---------------------------------------------'
puts 'Done!'
