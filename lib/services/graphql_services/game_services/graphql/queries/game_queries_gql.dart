String getAllGames = '''query getAllGames(\$whereGameFilter: game_bool_exp!) {
  game_aggregate(where: \$whereGameFilter){
    aggregate{
      count
    }
  }
  game(where: \$whereGameFilter) {
    id
    title
    thumbnail
    ispublished
    difficulty
    duration
    price
    program_type_id
    program_type {
      title
      value
      id
      price
    }
  }
}
''';
