/// Torii Mobile - Core UI Widgets
/// 
/// Minimalist, zen-inspired UI components for a Japanese learning platform.
/// Import this single file instead of individual component files.
/// 
/// Usage:
/// ```dart
/// import 'package:torii_app/core/widgets/widgets.dart';
/// ```
library;

// Cards
export 'cards/glass_card.dart';
export 'cards/elevated_card.dart';
export 'cards/gradient_card.dart';
export 'cards/minimal_card.dart' hide ElevatedCard;

// Badges
export 'badges/app_badge.dart';

// Stats
export 'stats/stat_card.dart';

// Progress
export 'progress/progress_bar.dart';

// Loading
export 'loading/shimmer_loading.dart';
export 'loading/zen_loading.dart';

// States
export 'states/empty_state.dart';

// Dividers
export 'dividers/section_divider.dart';

// Animations
export 'animations/entry_animation.dart';

// Shell
export 'app_shell.dart';

// Buttons
export 'buttons/zen_button.dart';

// Inputs
export 'inputs/zen_text_field.dart';

// Background
export 'zen_background.dart';
