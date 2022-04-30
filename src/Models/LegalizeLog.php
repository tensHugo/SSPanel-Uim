<?php

namespace App\Models;


class LegalizeLog extends Model
{
    protected $connection = 'default';
    protected $table = 'legalize_log';

    public function getUser(): ?User
    {
        return User::find($this->attributes['user_id']);
    }

}
