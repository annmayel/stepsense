# StepSense (Flutter, offline-first, simulated tracker mode)

## Status
Fully working Flutter app using local simulated step data. No Arduino /
MPU6050 / HC-05 hardware is required yet. Bluetooth is represented by
`BluetoothService` + `MockBluetoothService`.

## Run it
1. Install Flutter 3.22+ and Android SDK / emulator or Chrome.
2. `flutter pub get`
3. `flutter run`

The shell integration in this workspace is unreliable, so if `flutter`
commands do not return output in the embedded terminal, run them in a
normal external terminal (`cmd`, PowerShell, or VS Code terminal).

## Project structure
- `lib/main.dart` - app entry, bottom navigation shell, DI point.
  Replace `MockBluetoothService()` with `HC05BluetoothService()` later.
- `lib/models/day_record.dart`
- `lib/screens/` - home, goal, history, device, settings
- `lib/widgets/` - progress ring, stat cards, status pill, bar chart
- `lib/services/bluetooth_service.dart` - UI-facing Bluetooth abstraction
- `lib/services/mock_bluetooth_service.dart` - simulated tracker stream
- `lib/services/step_repository.dart` - app state, listens to Bluetooth
- `lib/storage/local_storage_service.dart` - SharedPreferences offline DB
- `lib/utils/step_calculator.dart` - distance/calorie/progress formulas
- `lib/theme/app_theme.dart`

## Offline data
SharedPreferences keys:
- `today_date` (`yyyy-MM-dd`), `today_steps`, `daily_goal`, `history_json`
- Day rollover archives yesterday into history and starts at 0.
- History is seeded once with 5 readable demo days.

## Formulas
- `distanceKm = steps * 0.76 / 1000`
- `calories = steps * 0.04`
- `progress = clamp(steps / goal, 0, 1)`

## Future HC-05 integration
1. Create `lib/services/hc05_bluetooth_service.dart` implementing
   `BluetoothService` (for example with `flutter_bluetooth_serial`).
2. Parse Arduino step packets and add them to `stepStream`.
3. In `main.dart`, inject `HC05BluetoothService()` instead of
   `MockBluetoothService()`.
4. No UI changes needed.
