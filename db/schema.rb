# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131026164816) do

  create_table "alumnos", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cedula"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grupo_id"
  end

  create_table "comunals", force: true do |t|
    t.string   "nombrec"
    t.string   "direccion"
    t.string   "vocero"
    t.string   "telefono"
    t.string   "correo"
    t.string   "ejet"
    t.string   "map"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grupos", force: true do |t|
    t.string   "nombre"
    t.string   "ci"
    t.integer  "alumno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "aprobado"
    t.integer  "user_id"
    t.integer  "profesore_id"
    t.integer  "institucione_id"
    t.integer  "estado_id"
    t.integer  "municipio_id"
    t.string   "nombrep"
  end

  create_table "instituciones", force: true do |t|
    t.string   "nombre"
    t.text     "direccion"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "municipios", force: true do |t|
    t.string   "nombre"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "necesidades", force: true do |t|
    t.string   "categoria"
    t.string   "prioridad"
    t.text     "description"
    t.date     "fecha"
    t.integer  "proceso"
    t.integer  "comunal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_ext"
    t.integer  "grupo_id"
  end

  create_table "parroquia", force: true do |t|
    t.string   "nombre"
    t.integer  "municipio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prfinstuciones", force: true do |t|
    t.integer  "institucione_id"
    t.integer  "profesore_id"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cedula"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "profesores", force: true do |t|
    t.integer  "user_id"
    t.integer  "prf_institucione"
    t.integer  "grupo_id"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "securities", force: true do |t|
    t.string   "nombre"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "namec"
    t.string   "email"
    t.integer  "rol"
    t.boolean  "confirm"
    t.integer  "estado_id"
    t.string   "dni"
    t.string   "telf"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.string   "apellido"
  end

end
