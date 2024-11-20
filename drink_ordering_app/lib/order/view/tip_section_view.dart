import 'package:domain/domain.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TipSectionView extends StatefulWidget {
  const TipSectionView({super.key});

  @override
  State<TipSectionView> createState() => _TipSectionViewState();
}

class _TipSectionViewState extends State<TipSectionView> {
  bool _isTipSelected = false;
  final Tip _selectedTip = Tip.small;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: _isTipSelected,
                        onChanged: _onTipSelected,
                        side: WidgetStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            color: states.contains(WidgetState.selected)
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.primary,
                            width: 0.5,
                          ),
                        ),
                        fillColor: WidgetStateProperty.all(Colors.transparent),
                        checkColor: Theme.of(context).colorScheme.onSecondaryFixed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Leave a tip',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_isTipSelected)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: _TipsRow(
                  selectedTip: _selectedTip,
                  onTipSelected: (tip) => context.read<OrderCubit>().setTip(tip),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _onTipSelected(bool? value) {
    setState(() {
      _isTipSelected = value ?? false;
    });
    if (value == false) {
      context.read<OrderCubit>().removeTip();
    }
  }
}

class _TipsRow extends StatelessWidget {
  const _TipsRow({required this.selectedTip, required this.onTipSelected});

  final Tip selectedTip;
  final void Function(Tip) onTipSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Tip.values
          .map(
            (tip) => _TipTile(
              icon: tip.name,
              tipAmount: tip.valueDisplayable,
              type: tip,
              selectedValue: selectedTip,
              onTap: () => onTipSelected(tip),
            ),
          )
          .toList(),
    );
  }
}

class _TipTile<T> extends StatelessWidget {
  const _TipTile({
    required this.icon,
    required this.tipAmount,
    required this.type,
    required this.selectedValue,
    required this.onTap,
    super.key,
  });

  final String icon;
  final String tipAmount;
  final T type;
  final T selectedValue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = type == selectedValue;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Radio(
                value: type,
                groupValue: selectedValue,
                onChanged: (_) => onTap(),
              ),
            ),
            const SizedBox(height: 8),
            // Image.asset(icon, color: isSelected ? AppColors.grey5050 : AppColors.whiteEEF1),
            const SizedBox(height: 8),
            Text(
              tipAmount,
              style: TextStyle(
                color: isSelected ? AppColors.grey5050 : Theme.of(context).colorScheme.onPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
