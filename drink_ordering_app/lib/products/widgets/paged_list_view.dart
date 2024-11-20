import 'package:drink_ordering_app/l10n/translations.dart';
import 'package:flutter/material.dart';

class PagedListView extends StatefulWidget {
  const PagedListView({
    required this.itemCount,
    required this.isLoadingMore,
    required this.onLoadMore,
    required this.isLastPage,
    required this.itemBuilder,
    required this.separatorBuilder,
    super.key,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final void Function() onLoadMore;
  final bool isLoadingMore;
  final Widget Function(BuildContext, int) separatorBuilder;
  final bool isLastPage;

  @override
  State<PagedListView> createState() => _PagedListViewState();
}

class _PagedListViewState extends State<PagedListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemBuilder: _itemBuilder,
      separatorBuilder: widget.separatorBuilder,
      itemCount: widget.itemCount + 1,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index == widget.itemCount) {
      if (widget.isLastPage) {
        return Center(
          child: Text(
            Translations.of(context).list_no_more_items,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      }
      return const Center(child: CircularProgressIndicator());
    }
    return widget.itemBuilder(context, index);
  }

  void _onScroll() {
    if (widget.isLoadingMore) {
      return;
    }

    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.7) {
      widget.onLoadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
