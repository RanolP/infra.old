# Comfort by Default

Ranol☆P가 운영하는 Minecraft, Minecraft: Java Edition 서버입니다.
여러 플러그인을 사용해 편의성을 향상시켜 서바이벌 플레이의 피로도를 줄였습니다.

허용 목록에 등록된 사람만 서버에 접속할 수 있으며,
테러, 버그 악용, 서버에 불필요한 부하를 주는 행위나 기타 불쾌감을 주는 행위 등은 적발될 경우 차단당할 수 있습니다.

기본적으로 기능은 Minecraft: Java Edition을 기준으로 개발되어 있기 때문에
Bedrock Edition 클라이언트에서 이상하게 작동할 수 있습니다.
Bedrock Edition 클라이언트에서 사용 가능한 경우 :star: 표시가 추가로 붙어 있으니 참고하시면 되겠습니다.
호환성이 검증되지 않은 경우 :question:이 붙어 있습니다.

## 삶의 품질을 높이는 기능 목록

- [x] 웹 지도 - BlueMap :star:
- [x] Java/Bedrock 에디션 동시 지원 - Geyser + Floodgate :star:
- [x] 시체 회수 - Graves :star:
- [x] 상자 정리 - ChestSort :question:
- [ ] 버림 방지
- [ ] 쓰레기통
- [ ] 귀환
  - [ ] Waystone
  - [ ] Home
- [ ] 생명력 막대/피해 표시기
- [ ] WAILA
- [ ] Tips/Guide
- [ ] Bundle 레시피 제공
- [ ] FindMe?
- [ ] Carry On
- [ ] Creative Flight
- [ ] Craftable Magics
- [ ] Artifacts
- [ ] Enchantments++
- [ ] Backpack?
- [ ] Sleep -> Buff
- [ ] Healing Campfire
- [ ] Dynamic Light?
- [ ] FastLeafDecay?
- [ ] Chunk Claim
- [ ] Teams
- [ ] Escape!
- [ ] Ultimine? Choptree?
- [ ] Hat
- [ ] Horse
- [ ] RPG-ish Combat
  - [ ] Parry
  - [ ] Dualwield
  - [ ] Roll
  - [ ] Wall-run
  - [ ] Wall Climb
- [ ] Travel Anchor
- [ ] Farming QoL
  - [ ] Farming -> XP
  - [ ] No Trampling
  - [ ] Right Click Harvest
- [ ] Tiny Charcoal <- Disc Fragment
- [ ] Wither Skeleton Skull Fragment <- Dark Oak Button
- [ ] Chat Relay
- [ ] Summoning Altar
- [ ] Enchantment Extractor

## 서버 실행

### 사전 요구 사항

- [asdf-vm](https://asdf-vm.com/)을 설치해주십시오. Java 런타임 관리를 위해 사용합니다.

### 설치

- `setup-runtime.sh`를 실행해 asdf 런타임이 깝니다.
- `setup-server.sh`를 실행해 서버 실행에 필요한 파일을 내려받습니다.
- `install.sh`를 실행해 systemd 서비스 파일을 생성해 배치합니다.
- `systemctl --user enable minecraft-vanilla`로 서비스를 활성화합니다.

### 시범 실행

- `run.sh`를 직접 실행해 서버를 실행해봅니다.

### 포트 정보

- Java Edition 서버: 25000 포트 - SRV 레코드를 활용해 25565 포트로 접속할 수 있습니다.
- Bedrock Edition 프록시: 19132 포트
- BlueMap 웹 서버: 25001 포트 - 리버스 프록시를 통해 443 포트로 HTTPS 접속이 가능합니다.
