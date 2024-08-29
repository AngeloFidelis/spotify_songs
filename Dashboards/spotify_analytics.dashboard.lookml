---
- dashboard: spotify_analytics
  title: spotify_analytics
  layout: newspaper
  description: ''
  preferred_slug: YBeJHHhp9sTl5DujFJ6jg6
  elements:
  - title: New Tile
    name: New Tile
    model: songs_spotify
    explore: analytic_songs
    type: single_value
    fields: [analytic_songs.popularity_year_select, analytic_songs.popularity_year_previous]
    filters: {}
    sorts: [analytic_songs.popularity_year_select]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Popularity
    comparison_label: Average Popularity Year Previous
    conditional_formatting: [{type: greater than, value: !!null '', background_color: "#173589",
        font_color: !!null '', color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5,
          palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 1
    listen:
      Select Year: analytic_songs.select_year
    row: 4
    col: 0
    width: 6
    height: 4
  - title: Genre Characteristics Comparison
    name: Genre Characteristics Comparison
    model: songs_spotify
    explore: analytic_songs
    type: marketplace_viz_spider::spider-marketplace
    fields: [analytic_songs.playlist_genre, analytic_songs.average_acousticness, analytic_songs.average_duration,
      analytic_songs.average_energy, analytic_songs.average_instrumentalness, analytic_songs.average_liveness,
      analytic_songs.average_speed_BPM, analytic_songs.average_valence]
    filters: {}
    sorts: [analytic_songs.average_acousticness desc 0]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    levels: 3
    label_factor: 87
    label_fine: 11
    rounded_strokes: true
    independent: true
    labelScale: true
    negatives: false
    wrap_width: 70
    opacity_area: 18
    dot_radius: 30
    opacity_circles: 0
    backgroundColor: "#CDCDCD"
    axisColor: "#CDCDCD"
    stroke_width: 16
    glow: 41
    axis_label_font: 12
    axis_scale_font: 10
    legend_font: 12
    legend_padding: 0
    legend_side: center
    rap_color: "#1440bd"
    pop_color: "#159918"
    latin_color: "#F0C733"
    r&b_color: "#D13452"
    edm_color: "#E48522"
    rock_color: "#B977A9"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    hidden_pivots: {}
    listen:
      Select Year: analytic_songs.select_year
    row: 8
    col: 0
    width: 9
    height: 12
  - title: Top Artist by year
    name: Top Artist by year
    model: songs_spotify
    explore: analytic_songs
    type: looker_grid
    fields: [top_artist.artist, top_artist.track_name, top_artist.album_name]
    filters: {}
    sorts: [top_artist.artist desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '1'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Select Year: analytic_songs.select_year
    row: 14
    col: 9
    width: 15
    height: 6
  - title: New Tile
    name: New Tile (2)
    model: songs_spotify
    explore: analytic_songs
    type: single_value
    fields: [analytic_songs.live_recordings]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Live Recordings
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Select Year: analytic_songs.select_year
    row: 4
    col: 6
    width: 4
    height: 4
  - title: New Tile
    name: New Tile (3)
    model: songs_spotify
    explore: analytic_songs
    type: single_value
    fields: [analytic_songs.track_released_selected_year, analytic_songs.track_released_year_previous]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Released songs this year
    comparison_label: songs released last year
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Select Year: analytic_songs.select_year
    row: 0
    col: 0
    width: 6
    height: 4
  - title: New Tile
    name: New Tile (4)
    model: songs_spotify
    explore: analytic_songs
    type: single_value
    fields: [analytic_songs.corr_loudness_energy]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Loudness vs. Energy
    defaults_version: 1
    listen:
      Select Year: analytic_songs.select_year
    row: 0
    col: 10
    width: 4
    height: 4
  - title: New Tile
    name: New Tile (5)
    model: songs_spotify
    explore: analytic_songs
    type: single_value
    fields: [analytic_songs.corr_valence_danceability]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Mood vs. Danceability
    conditional_formatting: [{type: less than, value: 0.5, background_color: '', font_color: "#1E0030",
        color_application: {collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5, palette_id: 46a4b248-19f7-4e71-9cf0-59fcc2c3039e},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Select Year: analytic_songs.select_year
    row: 4
    col: 10
    width: 4
    height: 4
  - title: New Tile
    name: New Tile (6)
    model: songs_spotify
    explore: analytic_songs
    type: single_value
    fields: [analytic_songs.songs_instrumentalness, analytic_songs.count]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Instrumental music
    value_format: ''
    comparison_label: released songs
    defaults_version: 1
    listen:
      Select Year: analytic_songs.select_year
    row: 0
    col: 6
    width: 4
    height: 4
  - title: Average Popularity by Month
    name: Average Popularity by Month
    model: songs_spotify
    explore: analytic_songs
    type: looker_area
    fields: [analytic_songs.average_popularity, analytic_songs.release_date_month]
    fill_fields: [analytic_songs.release_date_month]
    filters: {}
    sorts: [analytic_songs.release_date_month desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: analytic_songs.average_popularity,
            id: analytic_songs.average_popularity, name: Average Popularity}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '1'
    hide_legend: false
    swap_axes: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Select Year: analytic_songs.select_year
    row: 8
    col: 9
    width: 15
    height: 6
  - title: Danceability by musical genre
    name: Danceability by musical genre
    model: songs_spotify
    explore: analytic_songs
    type: looker_area
    fields: [analytic_songs.playlist_genre, analytic_songs.danceability_classification,
      analytic_songs.count]
    pivots: [analytic_songs.danceability_classification]
    filters: {}
    sorts: [analytic_songs.danceability_classification, analytic_songs.playlist_genre]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '12'
    series_colors:
      Moderately - analytic_songs.count: "#F9AB00"
      Low - analytic_songs.count: "#EA4335"
    swap_axes: false
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Select Year: analytic_songs.select_year
    row: 0
    col: 14
    width: 10
    height: 8
  filters:
  - name: Select Year
    title: Select Year
    type: field_filter
    default_value: '1974'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: songs_spotify
    explore: analytic_songs
    listens_to_filters: []
    field: analytic_songs.select_year
