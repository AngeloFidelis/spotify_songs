view: extends {

  #significa que esta visualização não pode ser unida a outras visualizações e, portanto, não estará visível para os usuários.
  extension: required

  dimension: track_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.track_id ;;
  }

  dimension: popularity {
    type: number
    sql: ${TABLE}.popularity ;;
  }

  dimension: artist {
    type: string
    sql: ${TABLE}.artist ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: track_name {
    type: string
    sql: ${TABLE}.track_name ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value | append: ' - ' | append: top_artist.artist._value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }
}
