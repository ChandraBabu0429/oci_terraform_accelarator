variable "compartment_id" {
 default  = "ocid1.compartment.oc1..aaaaaaaawxzeuwamurhd4gan6ik6pqaymzmwtutllbthjuv654rfi4b4te6a"
}
variable "group_id" {
 default  = "ocid1.group.oc1..aaaaaaaacecfjdgsqn7ynvjwpsadiztsmwktpzbzhopmkyne64ze6fivohpa"
}
variable "tenancy_ocid" {
  default  = "ocid1.tenancy.oc1..aaaaaaaaflhn3oc2orovphwnbs4735gwgglxvzersusi4dkyhslvfmjc6vlq"
}
 variable "user_ocid" {
  default  = "ocid1.user.oc1..aaaaaaaaijwjeo5dfpw3licrbbtrj3heevgixqviur4kdbpdtefu3n2dtzya"
}
variable "private_key_path" {
  default  = "~/.oci/oci_api_key.pem"
}
variable "fingerprint" {
  default  = "69:01:0f:9f:70:0b:f2:c5:bb:59:27:6d:0f:b5:ae:24"
}
variable "region" {
  default  = "us-chicago-1"
}
variable "namespace" {
  default  = "axxm1y2otkis"
}
variable "adw_admin_password" {
  default  = "Itversity123"
}
variable "oltp_admin_password" {
  default  = "Itversity123"
}
variable "name" {
   default  = "os-terraform-bucket"
}
variable "display_name" {
  default  = "demo-adw"
}
variable "object" {
  default  = "~/scratch.csv"
}
variable "subnet_cidr" {
   default  = "10.0.0.0/24"
}
variable "availability_domain" {
  default  = "kmEl:US-CHICAGO-1-AD-1"
}
variable "vcn_cidr" {
  default  = "10.0.0.0/16"
}
variable "metastore_default_external_table_location" {
  description = "Default location for external tables"
  default     = "oci://os-terraform-bucket@axxm1y2otkis"
}
variable "metastore_default_managed_table_location" {
  description = "Default location for external tables"
  default     = "oci://os-terraform-bucket@axxm1y2otkis"
}
variable "ssh_public_key" {
  type        = string
  description = "SSH public key"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCt0v7NIdvj8YB4yU2CDa1xEEcw71uQyYJjnFlOKxYcNdUQsEDQ1PBusDlsK1JMl2li/ANGDtauF+SPtVV0tn2/Ki353sfcttxw53Z4tkqehUtsINugALL39WWcwgKuCXIYWUj7r/Y99IGJY09dkgbr91aseekkqj+DxrCv+N2K/8QHAsAHryxmvfA0bjTrpH6tBHNsQmBEvQwrReNgvha+oyWmQNSFAEGywLdEhKP45fetqTS9STukver5K9j6CV2ZTgMn8gW4895r2Ct5B5ePBsKinVJD+A8wSDNBhhxc4TYtLazOa9sO08BpwMT9XHGmOaWI1FntolJndx0lO68lu0mmx1r/+33xn5+onxfZ8HdsOuPXq+ai5QYwO1jLIpCjn3xHzYSBikDxKp85WfiTvNhszud8sT86toZ25Ag9tyyfcUea1Zv7BvzYgvHqCUlP5okfWbEKqnGkjAX045P79dqeoKIB41W1uSy8QJPdITdPMPNxAqh126NkGoBJacc= chandrababu@DESKTOP-C275ADE"
}
variable "ssh_private_key" {
  description = "Path to the SSH private key file"
  type        = string
  default     = "~/.ssh/id_rsa"
}
variable "flex_instance_image_ocid" {
  type = map(string)
  default = {
    us-chicago-1 = "ocid1.image.oc1.us-chicago-1.aaaaaaaakgvdzq7di7lqtuipfzznaucaakrqi4oettoh6zxw3ujqjlhi3xbq"
  }
}
variable "image_id" {
  default  = "ocid1.image.oc1.us-chicago-1.aaaaaaaavjzlas2iatgreagez7ib7g22rnoxkqchfajp3ym4pigdthyrxrvq"
}
variable "num_instances" {
  default = "1"
}
variable "num_iscsi_volumes_per_instance" {
  default = "1"
}
variable "num_paravirtualized_volumes_per_instance" {
  default = "2"
}
variable "instance_shape" {
  default = "VM.Standard.E4.Flex"
}
variable "instance_ocpus" {
  default = 1
}
variable "instance_vcpus" {
  default = 2
}
variable "instance_shape_config_memory_in_gbs" {
  default = 1
}
variable "db_size" {
  default = "50" # size in GBs
}
variable "tag_namespace_description" {
  default = "Just a test"
}
variable "tag_namespace_name" {
  default = "testexamples-tag-namespace"
}









variable "description" {
  default     = "description"
  description = "A description for the Data Flow application."
}

# variable "display_name" {
#   default     = "test_session_app"
#   description = "The display name of the Data Flow application."
# }

variable "driver_shape" {
  default     = "VM.Standard.E4.Flex"
  description = "The shape of the driver VM for the Data Flow application."
}

variable "executor_shape" {
  default     = "VM.Standard.E4.Flex"
  description = "The shape of the executor VM for the Data Flow application."
}

variable "type" {
  default     = "SESSION"
  description = "The type of the Data Flow application."
}

variable "language" {
  default     = "PYTHON"
  description = "The programming language used for the Data Flow application."
}

variable "num_executors" {
  default     = "1"
  description = "The number of executors for the Data Flow application."
}

variable "spark_version" {
  default     = "3.2.1"
  description = "The version of Apache Spark used for the Data Flow application."
}

variable "max_duration_in_minutes" {
  default     = 60
  description = "The maximum duration (in minutes) for the Data Flow application."
}

variable "idle_timeout_in_minutes" {
  default     = 30
  description = "The idle timeout (in minutes) for the Data Flow application."
}

variable "driver_shape_memory_in_gbs" {
  default     = 16
  description = "The memory (in GBs) for the driver shape of the Data Flow application."
}

variable "driver_shape_ocpus" {
  default     = 1
  description = "The number of OCPUs for the driver shape of the Data Flow application."
}

variable "executor_shape_memory_in_gbs" {
  default     = 16
  description = "The memory (in GBs) for the executor shape of the Data Flow application."
}

variable "executor_shape_ocpus" {
  default     = 1
  description = "The number of OCPUs for the executor shape of the Data Flow application."
}

variable "file_uri" {
  default     = "oci://os-terraform-bucket@axxm1y2otkis"
  description = "The URI for the input file of the Data Flow application."
}

variable "logs_bucket_uri" {
  default     = "oci://os-terraform-bucket@axxm1y2otkis"
  description = "The URI for the logs bucket of the Data Flow application."
}
variable "data_flow_pool_max_instances" {
  description = "Maximum number of instances in the pool"
  type        = number
  default     = 9
}

variable "data_flow_pool_min_instances" {
  description = "Minimum number of instances in the pool"
  type        = number
  default     = 1
}

variable "data_flow_pool_shape" {
  description = "Shape of instances in the pool"
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "data_flow_pool_memory_in_gbs" {
  description = "Memory in gigabytes for instances in the pool"
  type        = number
  default     = 16
}

variable "data_flow_pool_ocpus" {
  description = "Number of CPUs for instances in the pool"
  type        = number
  default     = 1
}

variable "data_flow_pool_display_name" {
  description = "Display name for the Data Flow pool"
  type        = string
  default     = "Data Flow Pool"
}

variable "data_flow_pool_description" {
  description = "Description for the Data Flow pool"
  type        = string
  default     = "Test Data Flow Pool"
}

variable "data_flow_pool_idle_timeout" {
  description = "Idle timeout for the Data Flow pool in minutes"
  type        = number
  default     = 30
}

variable "sql_endpoint_display_name" {
  description = "Display name for the Data Flow SQL Endpoint"
  default     = "test_sql_endpoint"
}

# variable "driver_shape" {
#   description = "Shape for the SQL Endpoint driver"
#   default     = "VM.Standard.E4.Flex"
# }

variable "driver_shape_memory" {
  description = "Memory in GBs for the SQL Endpoint driver"
  default     = 16
}

# variable "driver_shape_ocpus" {
#   description = "Number of OCPUs for the SQL Endpoint driver"
#   default     = 2
# }

# variable "executor_shape" {
#   description = "Shape for the SQL Endpoint executor"
#   default     = "VM.Standard.E4.Flex"
# }

variable "executor_shape_memory" {
  description = "Memory in GBs for the SQL Endpoint executor"
  default     = 16
}

# variable "executor_shape_ocpus" {
#   description = "Number of OCPUs for the SQL Endpoint executor"
#   default     = 2
# }

variable "max_executor_count" {
  description = "Maximum executor count for the SQL Endpoint"
  default     = 2
}

variable "min_executor_count" {
  description = "Minimum executor count for the SQL Endpoint"
  default     = 1
}

variable "network_type" {
  description = "Network type for the SQL Endpoint"
  default     = "SECURE_ACCESS"
}

variable "sql_endpoint_version" {
  description = "SQL Endpoint version"
  default     = "3.2.1"
}

variable "freeform_tags" {
  description = "Freeform tags for the SQL Endpoint"
  type        = map(string)
  default     = {
    "Department" = "Finance"
  }
}