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
    use "aws-ecs" {
   region = "us-east-1"
   memory = 512
    }
  }

release {
  use "aws-alb" {
    }
  }
}
