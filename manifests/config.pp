define fluentd::config(
  Enum['present','absent']  $ensure = 'present',
  Hash $config = {},
) {
  include fluentd

  file { "${fluentd::config_path}/${title}":
    ensure  => $ensure,
    content => fluent_config($config),
    require => Class['Fluentd::Install'],
    notify  => Class['Fluentd::Service'],
  }
}
