# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_24_192950) do
  create_table "animal_types", force: :cascade do |t|
    t.string "species"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animals", force: :cascade do |t|
    t.integer "animal_type_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_type_id"], name: "index_animals_on_animal_type_id"
  end

  create_table "class_of_students", force: :cascade do |t|
    t.integer "teacher_id"
    t.string "symbol"
    t.integer "yearOfStart"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_class_of_students_on_teacher_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer "lessons_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lessons_id"], name: "index_courses_on_lessons_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "animal_id"
    t.integer "classrooms_id"
    t.integer "test_id"
    t.integer "class_of_students_id"
    t.integer "teacher_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_lessons_on_animal_id"
    t.index ["class_of_students_id"], name: "index_lessons_on_class_of_students_id"
    t.index ["classrooms_id"], name: "index_lessons_on_classrooms_id"
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
    t.index ["test_id"], name: "index_lessons_on_test_id"
  end

  create_table "presences", force: :cascade do |t|
    t.integer "students_id"
    t.integer "lessons_id"
    t.boolean "isPresent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lessons_id"], name: "index_presences_on_lessons_id"
    t.index ["students_id"], name: "index_presences_on_students_id"
  end

  create_table "student_grades", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "student_id"
    t.integer "course_id"
    t.integer "test_id"
    t.float "grade"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_student_grades_on_course_id"
    t.index ["student_id"], name: "index_student_grades_on_student_id"
    t.index ["teacher_id"], name: "index_student_grades_on_teacher_id"
    t.index ["test_id"], name: "index_student_grades_on_test_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.integer "class_of_students_id"
    t.string "firstName"
    t.string "lastName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_of_students_id"], name: "index_students_on_class_of_students_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "user_id"
    t.string "firstName"
    t.string "lastName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "text_messages", force: :cascade do |t|
    t.integer "user1_id"
    t.integer "user2_id"
    t.string "message"
    t.string "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user1_id"], name: "index_text_messages_on_user1_id"
    t.index ["user2_id"], name: "index_text_messages_on_user2_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password"
    t.string "e_mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "animals", "animal_types"
  add_foreign_key "class_of_students", "teachers"
  add_foreign_key "courses", "lessons", column: "lessons_id"
  add_foreign_key "lessons", "animals"
  add_foreign_key "lessons", "class_of_students", column: "class_of_students_id"
  add_foreign_key "lessons", "classrooms", column: "classrooms_id"
  add_foreign_key "lessons", "teachers"
  add_foreign_key "lessons", "tests"
  add_foreign_key "presences", "lessons", column: "lessons_id"
  add_foreign_key "presences", "students", column: "students_id"
  add_foreign_key "student_grades", "courses"
  add_foreign_key "student_grades", "students"
  add_foreign_key "student_grades", "teachers"
  add_foreign_key "student_grades", "tests"
  add_foreign_key "students", "class_of_students", column: "class_of_students_id"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "users"
  add_foreign_key "text_messages", "user1s"
  add_foreign_key "text_messages", "user2s"
end
