variable "backend_container_name" {
  type        = string
  description = "Backend Container Name for ECR"
}

resource "aws_ecs_cluster" "default" {
  name = "dns"
}

resource "aws_ecs_task_definition" "backend" {
  family = "backend"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu       = 256
  memory    = 512
  execution_role_arn = aws_iam_role.dns-ecs.arn

  container_definitions = jsonencode([
    {
      name      = "backend"
      image     = var.backend_container_name
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    },
  ])
}

resource "aws_ecs_service" "backend" {
  name            = "backend"
  cluster         = aws_ecs_cluster.default.id
  task_definition = aws_ecs_task_definition.backend.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = true
    security_groups = [aws_security_group.backend.id]
    subnets = [aws_subnet.public.id, aws_subnet.public2.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.backend-green.id
    container_name   = "backend"
    container_port   = 80
  }
}