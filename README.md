# Isaac Sim + ROS2

NVIDIA Isaac Sim(헤드리스 스트리밍)과 ROS2 Jazzy를 Docker Compose로 실행.

## 요구 사항

- Docker, Docker Compose
- NVIDIA GPU + 드라이버 + [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) (Isaac Sim 사용 시)

## 사용법

```bash
# 서비스 기동 (백그라운드)
docker compose up -d

# 상태 확인
docker compose ps

# 로그 보기
docker compose logs -f

# ROS2 셸 접속
docker compose exec ros2 bash
```

## 디렉터리 구조

```
├── docker-compose.yaml   # 서비스 정의
├── isaac-sim/            # Isaac Sim 이미지 빌드 및 볼륨
│   ├── Dockerfile
│   ├── run_isaac.sh
│   └── volumes/          # 캐시·로그·데이터 (바인드 마운트)
└── ros2/                 # ROS2 Jazzy 이미지 빌드 및 볼륨
    ├── Dockerfile
    └── volumes/          # ros2_ws 마운트용
```

## 환경 변수 (선택)

`docker-compose.yaml`의 `isaac-sim` 서비스에서:

- `PUBLIC_IP`: 스트리밍 접속용 공인 IP (NAT/다중 NIC 시 설정 권장)
- `SIGNAL_PORT`, `STREAM_PORT`, `WIDTH`, `HEIGHT`, `TARGET_FPS`: 스트림 포트·해상도·FPS
