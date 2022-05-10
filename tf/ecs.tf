resource "aws_ecs_cluster" "default" {
  name = "dns"
}

resource "aws_ecs_task_definition" "api" {
  family = "api"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu       = 256
  memory    = 512
  execution_role_arn = aws_iam_role.dns-ecs.arn

  container_definitions = jsonencode([
    {
      name      = "api"
      image     = format("%s%s",aws_ecr_repository.api.repository_url,":latest")
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

resource "aws_ecs_service" "api" {
  name            = "api"
  cluster         = aws_ecs_cluster.default.id
  task_definition = aws_ecs_task_definition.api.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = true
    security_groups = [aws_security_group.api.id]
    subnets = [aws_subnet.public.id, aws_subnet.public2.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.api.id
    container_name   = "api"
    container_port   = 80
  }
}