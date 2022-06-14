# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#




animal_type = AnimalType.create(
[
    {
        species: 'Kot',
        group: '3B'
    },
    {
        species: 'Pies',
        group: 'Weterynaria zwierząt domowych'
    },
    {
        species: 'Yellow Birb',
        group: 'Weterynaria zwierząt egzotycznych'
    },
    {
        species: 'Krowa',
        group: 'Weterynaria zwierząt gospodarczych'
    },
    {
        species: 'Osioł',
        group: 'Weterynaria zwierząt gospodarczych'
    },
    {
        species: 'koń',
        group: 'Weterynaria zwierząt gospodarczych'
    },
    {
        species: 'Świnia',
        group: 'Weterynaria zwierząt gospodarczych'
    },
    {
        species: 'Żółw',
        group: '2A'
    }
    
]
)

animals = Animal.create(
[
    {
        code: 'cat-005-asd',
        animal_type_id: '10'
    },
    {
        code: 'Felix',
        animal_type_id: '9'
    },
    {
        code: 'Osioł-007',
        animal_type_id: '8'
    },
    {
        code: 'Beta',
        animal_type_id: '7'
    },
    {
        code: 'Szwadron',
        animal_type_id: '4'
    },
    {
        code: 'Super',
        animal_type_id: '6'
    },
    {
        code: 'Cool',
        animal_type_id: '5'
    },
    {
        code: 'Komando',
        animal_type_id: '3'
    },
    {
        code: 'Wilków',
        animal_type_id: '2'
    },
    {
        code: 'alfa',
        animal_type_id: '1'
    }

])

course = Course.create(
    [
	{
	   name: 'Cat biology'
	},
	{
	   name: 'Hedgehog physiology'
	},
	{
	   name: 'Anatomy of a turtle'
	},
	{
	   name: 'Analizing cases of rats'
	},
	{
	   name: 'How to hold a cat?'
	},
	{
	   name: 'Making a dog calm'
	},
	{
	   name: 'Anatomy of birds'
	},
	{
	   name: 'Fish breathing'
	},
	{
	   name: 'Insect physiology'
	},
	{
	   name: 'Philosophy of animal operations'
	}
]
)

class_od_students = ClassOfStudent.create(
    [
	{
	   symbol: '1A',
	   yearOfStart: '2019',
	   teacher_id: '5'
	},
	{
	   symbol: '2D',
	   yearOfStart: '2019',
	   teacher_id: '8'
	},
	{
	   symbol: '3A',
	   yearOfStart: '2019',
	   teacher_id: '9'
	},
	{
	   symbol: '1C',
	   yearOfStart: '2019',
	   teacher_id: '4'
	},
	{
	   symbol: '2E',
	   yearOfStart: '2018',
	   teacher_id: '7'
	}
]
)

class_rooms = Classroom.create(
    [
	{
	   number: '013'
	},
	{
	   number: '017'
	},
	{
	   number: '019'
	},
	{
	   number: '021'
	},
	{
	   number: '022'
	},
	{
	   number: '037'
	},
	{
	   number: '039 '
	}
]
)

teachers = Teacher.create(
    [
    {
        firstName: 'Elżbieta',
        lastName: 'Michno',
        user_id: '1'
    },
    {
        firstName: 'Magdalena',
        lastName: 'Chojka',
        user_id: '2'
    },
    {
        firstName: 'Wojciech',
        lastName: 'Denkiewicz',
        user_id: '3'
    },
    {
        firstName: 'Michał',
        lastName: 'Rudy',
        user_id: '4'
    },
    {
        firstName: 'Robert',
        lastName: 'Wróbel',
        user_id: '5'
    },
    {
        firstName: 'Marta',
        lastName: 'Podkówka',
        user_id: '6'
    }
]   
)

lessons = Lesson.create(
[
	{
           date: '2022-03-10',
           teacher_id: '3',
           class_of_student_id: '127',
           animal_id: '69',
           test_id: '2137',
           classroom_id: '15',
           course_id: '7'
	},
	{
           date: '2022-03-14',
           teacher_id: '5',
           class_of_student_id: '131',
           animal_id: '13',
           test_id: '1515',
           classroom_id: '10',
	   course_id: '2'
	},
	{
           date: '2022-03-16',
           teacher_id: '4',
           class_of_student_id: '122',
           animal_id: '15',
           test_id: '3215',
           classroom_id: '8',
	   course_id: '4'
	},
	{
           date: '2022-03-17',
           teacher_id: '2',
           class_of_student_id: '129',
           animal_id: '58',
           test_id: '4585',
           classroom_id: '6',
	   course_id: '3'
	},
	{
           date: '2022-03-10',
           teacher_id: '1',
           class_of_student_id: '125',
           animal_id: '68',
           test_id: '3327',
           classroom_id: '14',
	   course_id: '8'
	}
]
)

students = Student.create(
    [
    {
        firstName: 'Sebastian',
        lastName: 'Słoniewski',
        user_id: '249438',
        class_of_student_id: '021'
    },
    {
        firstName: 'Kamil',
        lastName: 'Rejman',
        user_id: '248901',
        class_of_student_id: '420'
    },
    {
        firstName: 'Tomasz',
        lastName: 'Chrzanowski',
        user_id: '252775',
        class_of_student_id: '007'
    }, {
        firstName: 'Jakub',
        lastName: 'Derda',
        user_id: '248901',
        class_of_student_id: '666'
    },
    {
        firstName: 'Patrycja',
        lastName: 'Langkafel',
        user_id: '252744',
        class_of_student_id: '003'
    }
]
)

presences = Presence.create(
    [
	{
	   isPresent: 'false',
	   student_id: '7',
	   lesson_id: '3'
	},
	{
	   isPresent: 'true',
	   student_id: '4',
	   lesson_id: '12'
	},
	{
	   isPresent: 'true',
	   student_id: '6',
	   lesson_id: '15'
	},
	{
	   isPresent: 'false',
	   student_id: '1',
	   lesson_id: '9'
	},
	{
	   isPresent: 'true',
	   student_id: '10',
	   lesson_id: '5'
	},
	{
	   isPresent: 'true',
	   student_id: '11',
	   lesson_id: '2'
	},
	{
	   isPresent: 'true',
	   student_id: '8',
	   lesson_id: '19'
	},
	{
	   isPresent: 'true',
	   student_id: '17',
	   lesson_id: '5'
	},
	{
	   isPresent: 'true',
	   student_id: '16',
	   lesson_id: '3'
	},
	{
	   isPresent: 'true',
	   student_id: '9',
	   lesson_id: '4'
	},
	{
	   isPresent: 'true',
	   student_id: '19',
	   lesson_id: '10'
	},
	{
	   isPresent: 'true',
	   student_id: '21',
	   lesson_id: '2'
	}
]
)

grades = StudentGrade.create(
    [
	{
    	   grade: '5',
    	   date: '2022-03-25',
    	   teacher_id: '25',
    	   student_id: '007',
    	   course_id: '15',
    	   test_id: '8'
	}, 
	{
    	   grade: '4',
    	   date: '2022-03-25',
    	   teacher_id: '25',
    	   student_id: '420',
    	   course_id: '15',
    	   test_id: '8'
	}, 
	{
    	   grade: '4',
    	   date: '2022-03-25',
    	   teacher_id: '25',
    	   student_id: '021',
    	   course_id: '15',
    	   test_id: '8'
	}, 
	{
    	   grade: '4,5',
    	   date: '2022-03-12',
    	   teacher_id: '25',
    	   student_id: '255',
    	   course_id: '15',
    	   test_id: '6'
	}, 
	{
    	   grade: '5',
    	   date: '2022-03-10',
    	   teacher_id: '14',
    	   student_id: '007',
    	   course_id: '12',
    	   test_id: '6'
	}
]
)


tests = Test.create(
    [
    {
        name: 'bio-003-s',
        description: 'Histologia 1/2'
    }, 
    {
        name: 'mat-001-s',
        description: 'Funkcje trygonometryczne'
    },
    {
        name: 'mat-002-k',
        description: 'Podstawy trygonometrii'
    },
    {
        name: 'an-004-k',
        description: 'Anatomia zwierząt domowcyh 1/3'
    },
    {
        name: 'jpol-002-k',
        description: 'Stepy akermańskie'
    },
    {
        name: 'fiz-021-k',
        description: 'Fizyka czarnej dziury ( albo czary)'
    }
]
)


users = User.create(
    [
	{
	   login: 'ChamesBond',
	   email: '252775@student.pwr.edu.pl',
	   password: 'cisco',
	   password_confirmation: 'yes'
	},
	{
	   login: 'j.derda',
	   email: '248901@student.pwr.edu.pl',
	   password: 'Perceptus4Ever',
	   password_confirmation: 'yes'
	},
	{
	   login: 'krejman',
	   email: '248901@student.pwr.edu.pl',
	   password: 'SlayTheSpireEnjoyer420',
	   password_confirmation: 'yes'
	},
	{
	   login: 'Sebix',
	   email: '249438@student.pwr.edu.pl',
	   password: 'JaMamSilkeWtedy404',
	   password_confirmation: 'no'
	},
	{
	   login: 'Patrycja',
	   email: '252744',
	   password: 'TheSimsFan1',
	   password_confirmation: 'yes'
	}
]
)