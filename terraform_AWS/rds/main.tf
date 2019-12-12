resource "aws_db_instance" "database" {
    name = "mydb"
    identifier = "my-database"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t3.micro"
    availability_zone = "eu-west-3a"
    allocated_storage = 20
    storage_type = "standard"
    storage_encrypted = true
    username = "devopsamaeva"
    password = "Adma448784"
    multi_az = false
    apply_immediately = true
    maintenance_window = "mon:04:00-mon:04:30"
    backup_window = "02:00-02:30"
    backup_retention_period = "1"
    skip_final_snapshot = false
    final_snapshot_identifier = "my-database"
    parameter_group_name = "default.mysql5.7"
    copy_tags_to_snapshot = true
    auto_minor_version_upgrade = false

    tags {
        name = "mydb"
        identifier = "my-database"
        engine = "mysql"
    }
  
}
