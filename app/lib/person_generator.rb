# frozen_string_literal: true

# rubocop:disable Metrics/ClassLength
class PersonGenerator
  FIRST_NAMES = [
    'Aaron',
    'Abner',
    'Adalius',
    'Adam',
    'Adrian',
    'Aeneas',
    'Ahman',
    'Al',
    'Alan',
    'Albert',
    'Alex',
    'Allie',
    'Andre',
    'Andrew',
    'Andy',
    'Anquan',
    'Anthony',
    'Antonio',
    'Arian',
    'Art',
    'Audray',
    'Barry',
    'Bart',
    'Ben',
    'Bert',
    'Bill',
    'Blanton',
    'Bob',
    'Bobby',
    'Boomer',
    'Brad',
    'Brett',
    'Brian',
    'Bruce',
    'Bryant',
    'Buck',
    'Bud',
    'Buddy',
    'Bum',
    'Butch',
    'Calais',
    'Cam',
    'Carl',
    'Carson',
    'Chad',
    'Champ',
    'Chan',
    'Charles',
    'Charley',
    'Charlie',
    'Chip',
    'Chris',
    'Chuck',
    'Clay',
    'Clyde',
    'Cornelius',
    'Cornell',
    'Cortez',
    'Cortland',
    'Craig',
    'Cris',
    'Curly',
    'Curtis',
    'Damon',
    'Dan',
    'Danny',
    'Darius',
    'Darrell',
    'Darrelle',
    'Darren',
    'Daunte',
    'Dave',
    'David',
    'DeMarco',
    'DeMarcus',
    'Deacon',
    'Deion',
    'Dennis',
    'Dermontti',
    'Derrick',
    'Dick',
    'Dirk',
    'Dom',
    'Don',
    'Donnie',
    'Donovan',
    'Doug',
    'Drew',
    'Dudley',
    'Dutch',
    'Dwight',
    'Ed',
    'Edgerrin',
    'Eli',
    'Emmitt',
    'Eric',
    'Erich',
    'Eugene',
    'Forrest',
    'Fran',
    'Franco',
    'Frank',
    'Frankie',
    'Fred',
    'Gale',
    'Garrison',
    'Gary',
    'Gene',
    'Geno',
    'George',
    'Greasy',
    'Greg',
    'Gregg',
    'Gus',
    'Guy',
    'Haloti',
    'Hampton',
    'Hank',
    'Hardy',
    'Harland',
    'Harold',
    'Harris',
    'Harry',
    'Henry',
    'Herb',
    'Herbert',
    'Herm',
    'Herman',
    'Hines',
    'Homer',
    'Howie',
    'Hugh',
    'Hunk',
    'Isaac',
    'Isiah',
    'J.J.',
    'Jack',
    'Jack',
    'Jackie',
    'Jahri',
    'Jamal',
    'James',
    'Jared',
    'Jason',
    'Jay',
    'Jeff',
    'Jeremiah',
    'Jerry',
    'Jessie',
    'Jim',
    'Jim Lee',
    'Jimmy',
    'Jock',
    'Joe',
    'John',
    'John David',
    'Johnny',
    'Jon',
    'Jonathan',
    'Jordy',
    'Julian',
    'Julius',
    'June',
    'Junior',
    'Justin',
    'Karl',
    'Keith',
    'Ken',
    'Kevin',
    'Kurt',
    'Kyle',
    'LaDainian',
    'Lamar',
    'Lance',
    'Larry',
    'Lawrence',
    'LeRoy',
    'Lee Roy',
    'Leeman',
    'Lem',
    'Len',
    'Leroy',
    'Leslie',
    'Lindy',
    'Logan',
    'Lomas',
    'London',
    'Lou',
    'Louis',
    'Lovie',
    'Luke',
    'Lydell',
    'Marcus',
    'Mario',
    'Marion',
    'Mark',
    'Marshall',
    'Marty',
    'Marv',
    'Marvin',
    'Matt',
    'Matthew',
    'Max',
    'Mel',
    'Merlin',
    'Michael',
    'Michael Dean',
    'Mick',
    'Mike',
    'Minkah',
    'Mitchell',
    'Mo',
    'Monte',
    'NaVorro',
    'Neil',
    'Neill',
    'Nick',
    'Norm',
    'Norm',
    'Norv',
    'O.J.',
    'Orlando',
    'Otis',
    'Paddy',
    'Pat',
    'Patrick',
    'Paul',
    'Pepper',
    'Pete',
    'Peyton',
    'Phil',
    'Philip',
    'Pop',
    'Potsy',
    'Priest',
    'Ralph',
    'Randall',
    'Randy',
    'Rashean',
    'Ray',
    'Raymond',
    'Red',
    'Reggie',
    'Rex',
    'Rich',
    'Richard',
    'Richmond',
    'Rickey',
    'Ricky',
    'Rob',
    'Robert',
    'Rod',
    'Roger',
    'Rolland',
    'Roman',
    'Romeo',
    'Ron',
    'Ronde',
    'Ronnie',
    'Roy',
    'Russ',
    'Russell',
    'Sam',
    'Samari',
    'Sammy',
    'Sean',
    'Sheldon',
    'Sid',
    'Simeon',
    'Sonny',
    'Stan',
    'Stephon',
    'Steve',
    'Steven',
    'Ted',
    'Terrell',
    'Terry',
    'Thurman',
    'Tiki',
    'Tim',
    'Todd',
    'Tom',
    'Tommy',
    'Tony',
    'Torry',
    "Tre'Davious",
    'Trent',
    'Troy',
    'Tyreek',
    'Vince',
    'Vinny',
    'Von',
    'Wade',
    'Wally',
    'Walt',
    'Walter',
    'Warren',
    'Warrick',
    'Wayne',
    'Weeb',
    'Wes',
    'Wilber',
    'Wilbert',
    'Will',
    'William',
    'Willie',
    'Yale',
    'Zach'
  ].freeze

  LAST_NAMES = [
    'Abraham',
    'Adderley',
    'Aikman',
    'Albert',
    'Allen',
    'Alworth',
    'Anderson',
    'Andrews',
    'Arians',
    'Armstead',
    'Armstrong',
    'Atkins',
    'Bach',
    'Bailey',
    'Barber',
    'Barnes',
    'Barney',
    'Barton',
    'Baugh',
    'Baumhower',
    'Belichick',
    'Bell',
    'Bengtson',
    'Bennett',
    'Berry',
    'Betters',
    'Beuerlein',
    'Biletnikoff',
    'Billick',
    'Blanda',
    'Bledsoe',
    'Blount',
    'Boldin',
    'Bowles',
    'Bowman',
    'Boyd',
    'Bradshaw',
    'Brady',
    'Brees',
    'Briggs',
    'Brock',
    'Brodie',
    'Brooks',
    'Brown',
    'Bruce',
    'Brunell',
    'Buchanan',
    'Bugel',
    'Buoniconti',
    'Burnett',
    'Burns',
    'Butler',
    'Caldwell',
    'Campbell',
    'Capers',
    'Carr',
    'Carroll',
    'Carson',
    'Carter',
    'Chamberlin',
    'Chandler',
    'Childress',
    'Christiansen',
    'Clark',
    'Collier',
    'Conzelman',
    'Coryell',
    'Coslet',
    'Coughlin',
    'Cowher',
    'Craig',
    'Crennel',
    'Crow',
    'Culpepper',
    'Cunningham',
    'Curtis',
    'Davis',
    'Dawkins',
    'Dawson',
    'DeGroot',
    'Del Rio',
    'Dent',
    'Devine',
    'Dickerson',
    'Ditka',
    'Doleman',
    'Donald',
    'Dooley',
    'Dorais',
    'Dorsett',
    'Douglas',
    'Driscoll',
    'Duerson',
    'Dungy',
    'Dunn',
    'Edwards',
    'Ellard',
    'Eller',
    'Ellis',
    'Elway',
    'Erhardt',
    'Erickson',
    'Esiason',
    'Evans',
    'Ewbank',
    'Fairbanks',
    'Faneca',
    'Farrior',
    'Fassel',
    'Faulk',
    'Favre',
    'Finnegan',
    'Fischer',
    'Fisher',
    'Fitzgerald',
    'Fitzpatrick',
    'Flacco',
    'Flaherty',
    'Fletcher',
    'Flores',
    'Fontes',
    'Foreman',
    'Fortunato',
    'Foster',
    'Fouts',
    'Fox',
    'Frazier',
    'Gabriel',
    'Gailey',
    'Gannon',
    'Garcia',
    'Garrett',
    'Gase',
    'Gastineau',
    'Gates',
    'Gibbs',
    'Gildon',
    'Gillman',
    'Gilmore',
    'Glanville',
    'Godfrey',
    'Goff',
    'Gonzalez',
    'Gore',
    'Grant',
    'Grantham',
    'Green',
    'Greene',
    'Gregg',
    'Griese',
    'Griffin',
    'Grogan',
    'Gruden',
    'Gurley',
    'Hadl',
    'Halas',
    'Haley',
    'Ham',
    'Hampton',
    'Hanburger',
    'Hanifan',
    'Hannah',
    'Harbaugh',
    'Harris',
    'Harrison',
    'Hart',
    'Haslett',
    'Haynes',
    'Haynesworth',
    'Hearst',
    'Hendricks',
    'Hennigan',
    'Henning',
    'Hickey',
    'Hill',
    'Holmes',
    'Holmgren',
    'Holovak',
    'Holt',
    'Houston',
    'Howell',
    'Howley',
    'Hughitt',
    'Hutchinson',
    'Infante',
    'Irvin',
    'Ivy',
    'Jackson',
    'James',
    'Jauron',
    'Johnson',
    'Johnsos',
    'Joiner',
    'Jones',
    'Jordan',
    'Jurgensen',
    'Kelly',
    'Kenn',
    'Kennedy',
    'Kiesling',
    'Klecko',
    'Knox',
    'Koetter',
    'Kotite',
    'Krause',
    'Krieg',
    'Kubiak',
    'Kuechly',
    'Kuharich',
    'Lachey',
    'Lambeau',
    'Lambert',
    'Landry',
    'Lane',
    'Largent',
    'Lary',
    'Lawrence',
    'Lee',
    'Lemm',
    'Leonard',
    'Levy',
    'Lewis',
    'Light',
    'Lilly',
    'Little',
    'Lloyd',
    'Lofton',
    'Lombardi',
    'Long',
    'Lott',
    'Lynch',
    'Lynn',
    'Mack',
    'Mackovic',
    'Madden',
    'Madison',
    'Mahomes',
    'Majkowski',
    'Malavasi',
    'Mangini',
    'Mankins',
    'Manning',
    'Marchibroda',
    'Marino',
    'Mariucci',
    'Marrone',
    'Marshall',
    'Martin',
    'Martz',
    'Mathis',
    'Matthews',
    'Mawae',
    'Maynard',
    'McCafferty',
    'McCarthy',
    'McCormack',
    'McCoy',
    'McCutcheon',
    'McDaniel',
    'McDermott',
    'McDole',
    'McKay',
    'McMichael',
    'McMillian',
    'McNabb',
    'McNair',
    'McPeak',
    'McVay',
    'Mecklenburg',
    'Meyer',
    'Michaels',
    'Michelosen',
    'Millard',
    'Miller',
    'Mills',
    'Mitchell',
    'Monk',
    'Montana',
    'Montgomery',
    'Montoya',
    'Moon',
    'Moore',
    'Mora',
    'Morton',
    'Moss',
    'Mularkey',
    'Munchak',
    'Munoz',
    'Murray',
    'Nagy',
    'Nalen',
    'Namath',
    'Nash',
    'Neale',
    'Nelson',
    'Newman',
    'Newton',
    'Ngata',
    'Nickerson',
    'Nicks',
    'Nitschke',
    'Nolan',
    'Noll',
    'Norton',
    "O'Brien",
    'Ogden',
    'Olsen',
    'Otto',
    'Owen',
    'Owens',
    'Pace',
    'Pagano',
    'Page',
    'Palmer',
    'Parcells',
    'Pardee',
    'Parker',
    'Patera',
    'Payton',
    'Pederson',
    'Peppers',
    'Perkins',
    'Perry',
    'Peters',
    'Peterson',
    'Philbin',
    'Phillips',
    'Polamalu',
    'Pool',
    'Prothro',
    'Quinn',
    'Ralston',
    'Randle',
    'Ratliff',
    'Rauch',
    'Reed',
    'Reeves',
    'Reid',
    'Renfro',
    'Revis',
    'Rhodes',
    'Rice',
    'Richardson',
    'Riggins',
    'Riley',
    'Rivera',
    'Rivers',
    'Roaf',
    'Robertson',
    'Robinson',
    'Rodgers',
    'Roethlisberger',
    'Rolle',
    'Romanowski',
    'Romo',
    'Ross',
    'Russell',
    'Rutigliano',
    'Ryan',
    'Saban',
    'Sanders',
    'Sapp',
    'Saturday',
    'Sayers',
    'Schafer',
    'Schafrath',
    'Schmidt',
    'Schottenheimer',
    'Schwartz',
    'Scott',
    'Seau',
    'Seifert',
    'Shanahan',
    'Sharper',
    'Shaw',
    'Shell',
    'Sherman',
    'Shields',
    'Shula',
    'Shurmur',
    'Simmons',
    'Simms',
    'Simpson',
    'Singletary',
    'Skorich',
    'Slater',
    'Smith',
    'Snead',
    'Sparano',
    'Stabler',
    'Stafford',
    'Stallings',
    'Stanley',
    'Starr',
    'Staubach',
    'Stephenson',
    'Strader',
    'Strahan',
    'Stram',
    'Stydahar',
    'Suggs',
    'Sutherland',
    'Svare',
    'Swilling',
    'Switzer',
    'Tarkenton',
    'Taylor',
    'Testaverde',
    'Theismann',
    'Thomas',
    'Tice',
    'Tingelhoff',
    'Tippett',
    'Tobin',
    'Tomlin',
    'Tomlinson',
    'Trimble',
    'Trotter',
    'Tuck',
    'Turner',
    'Tyrer',
    'Unitas',
    'Upshaw',
    'Urlacher',
    'Van Brocklin',
    'Vasquez',
    'Vermeil',
    'Vincent',
    'Walsh',
    'Walton',
    'Wannstedt',
    'Ward',
    'Ware',
    'Warfield',
    'Warner',
    'Washington',
    'Watt',
    'Watters',
    'Wayne',
    'Webb',
    'Webster',
    'Whisenhunt',
    'White',
    'Whitworth',
    'Wilfork',
    'Wilkerson',
    'Williams',
    'Willis',
    'Wilson',
    'Winner',
    'Wisniewski',
    'Witten',
    'Wood',
    'Woodson',
    'Wright',
    'Wyche',
    'Yary',
    'Young',
    'Youngblood',
    'Zimmer',
    'Zimmerman'
  ].freeze

  POSITIONS = { 'player' => %w[QB RB WR TE OL DL LB S CB K P],
                'coach' => %w[HC OC DC] }.freeze

  AGE_RANGE = { 'player' => 21..35,
                'coach' => 35..60 }.freeze

  MAX_SALARY = 30_000_000

  def self.create_person(role = 'player', franchise = nil, position = nil)
    rating = generate_rating
    position ||= POSITIONS[role].sample

    person_params = {
      franchise: franchise,
      name: "#{FIRST_NAMES.sample} #{LAST_NAMES.sample}",
      position: position,
      role: role,
      rating: rating,
      age: Random.new.rand(AGE_RANGE[role]),
      salary: generate_salary(rating)
    }

    Person.create(person_params)
  end

  def self.generate_rating
    @rating_generator ||= Rubystats::BetaDistribution.new(7, 3)
    @rating_generator.icdf(rand) * 100
  end

  def self.generate_salary(rating)
    @salary_generator ||= Rubystats::ExponentialDistribution.new(1)
    MAX_SALARY * @salary_generator.pdf(10.0 - rating / 10.0)
  end
end
# rubocop:enable Metrics/ClassLength
