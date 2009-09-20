package Reactant::Schema::Result::Blog;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("blog");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "title",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
  "author",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to("author", "Reactant::Schema::Result::User", { id => "author" });
__PACKAGE__->has_many(
  "blog_posts",
  "Reactant::Schema::Result::BlogPost",
  { "foreign.blog" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-18 18:06:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Kn0PP20JXE22IbDD2EqMYg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
