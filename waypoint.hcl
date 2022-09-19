project = "hashiconf-demo"

runner {
  enabled = true

  data_source "git" {
    url  = "https://github.com/BukkyAdebayo/hashiconf-demo.git"
    path = ""
  }
}

app "hashiconf-demo" {
  labels = {
    "service" = "go-k8s",
    "env"     = "dev"
  }

  
  build {
    use "docker" {}
    registry {
      use "docker" {
        image = "ttl.sh/bukky-waypoint-go-k8s"
        tag = "1h"
      }
    }
  }

  deploy {
    use "kubernetes" {
      probe_path = "/"
      service_port = 3000
    }
  }

  release {
    use "kubernetes" {
      load_balancer = true
    }
  }
}
