import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/locales.g.dart';
import 'loading.dart';

typedef ActionOnData = Future<void> Function();
typedef ItemView<T> = Widget Function(T item, int index);

class CustomListView<T> extends StatefulWidget {
  const CustomListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.onRefresh,
    this.reverse = false,
  });

  final ActionOnData? onRefresh;
  final List<T>? items;
  final ItemView<T> itemBuilder;
  final bool reverse;

  @override
  State<CustomListView<T>> createState() => _CustomListViewState();
}

class _CustomListViewState<T> extends State<CustomListView<T>> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  @override
  Widget build(BuildContext context) => _list();

  Widget _list() => widget.items == null
      ? const CustomLoading()
      : widget.items!.isNotEmpty
      ? widget.onRefresh == null
            ? _listBuilder()
            : RefreshIndicator(
                color: Colors.red,
                edgeOffset: 10,
                displacement: 50,
                onRefresh: widget.onRefresh!,
                child: _listBuilder(),
              )
      : widget.onRefresh == null
      ? _emptyWidget()
      : RefreshIndicator(
          color: Colors.red,
          edgeOffset: 10,
          displacement: 50,
          onRefresh: widget.onRefresh!,
          child: _emptyWidget(),
        );

  Widget _emptyWidget() =>
      Center(child: Text(LocaleKeys.taxi_4030_app_shared_no_item.tr));

  Widget _listBuilder() => ListView.builder(
    reverse: widget.reverse,
    itemBuilder: (context, index) => _buildItems(widget.items![index], index),
    itemCount: widget.items!.length,
  );

  Widget _buildItems(T item, int index) => widget.itemBuilder(item, index);
}
