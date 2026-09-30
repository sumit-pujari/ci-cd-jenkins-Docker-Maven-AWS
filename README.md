# 🚀 CI/CD Pipeline for Containerized Spring Boot Application
## A complete CI/CD pipeline for a Spring Boot application using:

- ☕ Java 21
- 🌱 Spring Boot
- 🔨 Maven
- 🐳 Docker
- ⚙️ Jenkins
- ☁️ AWS EC2
- 🐙 GitHub
- 🐧 Linux/Ubuntu
- 🔄 Automated Build, Test, Package, Containerization and Deployment

---
## 📌 Project Overview

This project demonstrates a complete CI/CD pipeline for a containerized Spring Boot application.

The application source code is stored in GitHub.

Whenever the project is built through Jenkins, Jenkins automatically performs:

1. Source code checkout
2. Maven compilation
3. Automated testing
4. JAR packaging
5. Docker image creation
6. Docker container deployment
7. Application availability verification

The final application runs inside a Docker container on an AWS EC2 instance.

---

## 🔄 What is CI/CD?

### Continuous Integration (CI)

Continuous Integration is the practice of frequently integrating code changes into a shared repository.

Whenever developers push changes, the CI system can automatically:

- Download the latest code
- Compile the application
- Run tests
- Detect build failures

In this project, Jenkins performs the CI part.

```text
Developer
    |
    | git push
    v
GitHub
    |  webhook
    v
Jenkins
    |
    +----> Compile
    |
    +----> Test
    |
    +----> Package
```

### Continuous Delivery / Deployment (CD)

Continuous Deployment extends CI by automatically deploying the successfully built application.

In this project:
```text
Build
  |
  v
Docker Image
  |
  v
Docker Container
  |
  v
AWS EC2
  |
  v
Running Application
```
---
## 🏗️ Project Architecture
                         ┌─────────────────┐
                         │    Developer    │
                         └────────┬────────┘
                                  │
                                  │ git push
                                  ▼
                         ┌─────────────────┐
                         │     GitHub      │
                         └────────┬────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │     Jenkins     │
                         │                 │
                         │  1. Checkout    │
                         │  2. Build       │
                         │  3. Test        │
                         │  4. Package     │
                         │  5. Docker Build│
                         │  6. Deploy      │
                         │  7. Verify      │
                         └────────┬────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │    Docker       │
                         │                 │
                         │  Spring Boot    │
                         │  Application    │
                         └────────┬────────┘
                                  │
                                  │ Port Mapping
                                  │ 8081 → 8080
                                  ▼
                         ┌─────────────────┐
                         │    AWS EC2      │
                         │                 │
                         │ Host: 8081      │
                         │ Container: 8080 │
                         └─────────────────┘

  ---

## 🛠️ Technologies Used
| Technology  | Purpose                         |
| ----------- | ------------------------------- |
| GitHub      | Source code management          |
| Jenkins     | CI/CD automation                |
| Maven       | Build and dependency management |
| Java 21     | Application runtime             |
| Spring Boot | Backend application             |
| Docker      | Application containerization    |
| AWS EC2     | Cloud server                    |
| Ubuntu      | Operating system                |
| Git         | Version control                 |
| Bash/Shell  | Automation commands             |

---

## 🏆 Output
![Project Architecture](Result/Jenkins.png)
