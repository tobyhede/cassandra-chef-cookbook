default[:cassandra] = {
  :cluster_name => "Test Cluster",
  :initial_token => "",
  :version => '1.2.9',
  :package_version => "dsc12",
  :user => "cassandra",
  :jvm  => {
    :xms => 32,
    :xmx => 512
  },
  :limits => {
    :memlock => 'unlimited',
    :nofile  => 48000
  },
  :installation_dir => "/usr/local/cassandra",
  :bin_dir          => "/usr/local/cassandra/bin",
  :lib_dir          => "/usr/local/cassandra/lib",
  :conf_dir         => "/etc/cassandra/",
  # commit log, data directory, saved caches and so on are all stored under the data root. MK.
  :data_root_dir    => "/var/lib/cassandra/",
  :commitlog_dir    => "/var/lib/cassandra/",
  :log_dir          => "/var/log/cassandra/",
  :listen_address   => node[:ipaddress],
  :rpc_address      => node[:ipaddress],
  :max_heap_size    => nil,
  :heap_new_size    => nil,
  :vnodes           => false,
  :seeds            => [],
  :concurrent_reads => 32,
  :concurrent_writes => 32,
  :snitch           => 'SimpleSnitch'
}
default[:cassandra][:tarball] = {
  :url => "http://www.eu.apache.org/dist/cassandra/#{default[:cassandra][:version]}/apache-cassandra-#{default[:cassandra][:version]}-bin.tar.gz",
  :md5 => "f6a5738200b281ef098e90be3fa30cf2"
}



# if node["cassandra"]["package_version"] 
#   case node["cassandra"]["version"]
#     when "2.0"
#       node.set["cassandra"]["package_version"] = "dsc20"
#     else
#       node.set["cassandra"]["package_version"] = "dsc12"
#   end
# end