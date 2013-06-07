<?php

namespace Pim\Bundle\ProductBundle\Form\Subscriber;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Form\FormEvent;

/**
 * @author    Gildas Quemener <gildas.quemener@gmail.com>
 * @copyright 2013 Akeneo SAS (http://www.akeneo.com)
 * @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 */
class FilterLocaleValueSubscriber implements EventSubscriberInterface
{
    protected $currentLocale;

    public function __construct($currentLocale)
    {
        $this->currentLocale = $currentLocale;
    }

    public static function getSubscribedEvents()
    {
        return array(
            FormEvents::PRE_SET_DATA => 'preSetData',
        );
    }

    public function preSetData(FormEvent $event)
    {
        $data = $event->getData();
        $form = $event->getForm();

        if (null === $data) {
            return;
        }

        foreach ($data as $name => $value) {
            if ($this->currentLocale &&
                $this->isTranslatable($value->getAttribute()) &&
                !$this->isInCurrentLocale($value)) {
                $form->remove($name);
            }
        }
    }

    private function isTranslatable($attribute)
    {
        return $attribute && $attribute->getTranslatable();
    }

    private function isInCurrentLocale($value)
    {
        return $value->getLocale() && $value->getLocale() === $this->currentLocale;
    }
}
