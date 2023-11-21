String getAllDrillsByGame =
    '''query getAllDrillsByGame(\$whereDrillFilter: drill_bool_exp!) {
  drill_aggregate(where: \$whereDrillFilter) {
    aggregate {
      count
    }
  }
  drill(where: \$whereDrillFilter) {
    id
    title
    thumbnail
    ispublished
    difficulty
    duration
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
