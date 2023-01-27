<?php

namespace App\Form;

use App\Entity\Mission;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PostSubmitType
{



    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Mission::class,
            // enable/disable CSRF protection for this form
            'csrf_protection' => true,
            // the name of the hidden HTML field that stores the token
            'csrf_field_name' => '_token',
            // an arbitrary string used to generate the value of the token
            // using a different string for each form improves its security
            'csrf_token_id' => 'PostSubmit_item',
        ]);
    }
}