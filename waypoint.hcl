project = "go-k8s"

app "go-k8s" {
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
