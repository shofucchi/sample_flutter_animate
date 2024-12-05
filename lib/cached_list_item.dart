import 'package:flutter/material.dart';

class CachedListItem extends StatefulWidget {
  const CachedListItem({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;

  @override
  State<CachedListItem> createState() => _CachedListItemState();
}

class _CachedListItemState extends State<CachedListItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListTile(
      leading: widget.leading,
      title: widget.title,
      subtitle: widget.subtitle,
      trailing: widget.trailing,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
