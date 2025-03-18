# TFE-DevOps-Kubernetes
## Introduction
Le domaine de l'informatique moderne exige de plus en plus de pratiques efficaces pour gérer et déployer des applications à grande échelle. Dans ce cadre, les méthodologies DevOps jouent un rôle essentiel en permettant d'automatiser les processus de développement, de déploiement et de gestion des infrastructures. Le DevOps permet ainsi de réduire les délais de livraison des logiciels tout en augmentant leur fiabilité grâce à l'intégration continue (CI) et à la livraison continue (CD).

Le projet de Travail de Fin d'Études (TFE) s'inscrit dans cette dynamique, avec pour objectif de concevoir et déployer une application complète en utilisant des outils DevOps modernes. L'application choisie pour ce projet est une application web, comprenant un frontend, un backend, et une base de données, le tout conteneurisé et déployé dans un environnement cloud via Kubernetes.

L'approche DevOps adoptée pour ce TFE inclut plusieurs étapes clés :

Conteneurisation de l’application avec Docker, permettant de garantir une portabilité et une isolation des services.
Orchestration des services avec Kubernetes, un outil de gestion de conteneurs qui simplifie le déploiement, la mise à l'échelle et la gestion des applications dans des environnements distribués.
Automatisation du pipeline CI/CD avec Jenkins, pour effectuer les tâches de compilation, de test, et de déploiement de manière continue.
Tests automatisés de l'application avec Selenium, une solution permettant de réaliser des tests fonctionnels sur le frontend de l'application afin de vérifier son bon fonctionnement.
Suivi et surveillance des performances des services avec Grafana et Prometheus, pour collecter et visualiser les métriques des différentes applications déployées.
L'utilisation de SonarQube sera également intégrée dans le pipeline pour effectuer une analyse continue de la qualité du code, afin de s'assurer que l'application respecte les bonnes pratiques de développement et de sécurité. Enfin, l'infrastructure nécessaire à ce projet sera provisionnée et gérée avec Terraform et Ansible, des outils d'automatisation d'infrastructure, permettant de déployer et de configurer facilement des ressources cloud.

L'objectif principal de ce projet est donc de démontrer l'intégration et l'automatisation des pratiques DevOps à travers un pipeline complet, en utilisant des outils et des technologies modernes comme Kubernetes, Docker, Jenkins, Selenium, et Terraform, afin de créer une chaîne de développement et de déploiement robuste, fiable et évolutive.
