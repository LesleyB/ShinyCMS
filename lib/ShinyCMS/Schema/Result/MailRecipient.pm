use utf8;
package ShinyCMS::Schema::Result::MailRecipient;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ShinyCMS::Schema::Result::MailRecipient

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::EncodedColumn>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn");

=head1 TABLE: C<mail_recipient>

=cut

__PACKAGE__->table("mail_recipient");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 200

=head2 token

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 created

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 200 },
  "token",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "created",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<mail_recipient_email>

=over 4

=item * L</email>

=back

=cut

__PACKAGE__->add_unique_constraint("mail_recipient_email", ["email"]);

=head1 RELATIONS

=head2 list_recipients

Type: has_many

Related object: L<ShinyCMS::Schema::Result::ListRecipient>

=cut

__PACKAGE__->has_many(
  "list_recipients",
  "ShinyCMS::Schema::Result::ListRecipient",
  { "foreign.recipient" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 queued_emails

Type: has_many

Related object: L<ShinyCMS::Schema::Result::QueuedEmail>

=cut

__PACKAGE__->has_many(
  "queued_emails",
  "ShinyCMS::Schema::Result::QueuedEmail",
  { "foreign.recipient" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-09-06 17:02:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XX2YGj+fP7KBb2ovzg4Iqg


__PACKAGE__->many_to_many( roles => 'list_recipients', 'mailing_list' );


# EOF
__PACKAGE__->meta->make_immutable;
1;

